from hyperon import *
from hyperon.ext import register_atoms
import re
import random
import string
import time
from hyperon.atoms import AtomType, OperationAtom, V

# Helper func for list operations
def parse_list_structure(input_str):
    elements, current, in_word = [], "", False
    for char in input_str:
        if char == '(':
            if in_word:
                elements.append(f'"{current.strip()}", ')
                current, in_word = "", False
            elements.append('[')
        elif char == ')':
            if in_word:
                elements.append(f'"{current.strip()}"')
                current, in_word = "", False
            elements.append('], ')
        elif char.isspace():
            if in_word:
                elements.append(f'"{current.strip()}", ')
                current, in_word = "", False
        else:
            current += char
            in_word = True
    if in_word:
        elements.append(f'"{current.strip()}"')
    
    parsed_str = ''.join(elements).replace(', ]', ']').rstrip(', ')
    return eval(parsed_str)

def flatten_list(nested_list):
    if isinstance(nested_list, list):
        return [item for sublist in nested_list for item in flatten_list(sublist)]
    return [nested_list]

def combine_lists_recursive(list1, list2, length, current_combination=None, index1=0, index2=0):
    if current_combination is None:
        current_combination = []
    if len(current_combination) == length:
        return [current_combination]
    
    combinations = []
    for i in range(index1, len(list1)):
        new_combination = current_combination + [list1[i]]
        combinations.extend(combine_lists_recursive(list1, list2, length, new_combination, i + 1, index2))
    for j in range(index2, len(list2)):
        new_combination = current_combination + [list2[j]]
        combinations.extend(combine_lists_recursive(list1, list2, length, new_combination, index1, j + 1))
    return combinations

def combine_lists(list1, list2):
    flat_list1 = flatten_list(list1)
    flat_list2 = flatten_list(list2)
    return combine_lists_recursive(flat_list1, flat_list2, max(len(flat_list1), len(flat_list2)))

def unique_combinations(combinations, list1, list2):
    flat_list1_set = set(str(item) for item in flatten_list(list1))
    flat_list2_set = set(str(item) for item in flatten_list(list2))
    seen, unique_combos = set(), []
    for combo in combinations:
        sorted_combo = tuple(sorted(str(item) for item in combo))
        combo_set = set(sorted_combo)
        if sorted_combo not in seen and combo_set != flat_list1_set and combo_set != flat_list2_set:
            seen.add(sorted_combo)
            unique_combos.append(combo)
    return unique_combos

def combine_lists_op(metta: MeTTa, var1, var2):
    list1 = parse_list_structure(str(var1).replace('"', ''))
    list2 = parse_list_structure(str(var2).replace('"', ''))
    unique_combos = unique_combinations(combine_lists(list1, list2), list1, list2)
    combined_pattern = " ".join([f"({combo[0]} {combo[1]} {combo[2]})" for combo in unique_combos])
    return metta.parse_all(f"({combined_pattern})")

# Helper func for variable
def generate_random_string(length=1):
    return ''.join(random.choices(string.ascii_uppercase + string.digits, k=length))

def extract_variables_from_atom(atom):
    pattern = r"\$[^\s\(\)]+"
    return [var for var in re.findall(pattern, str(atom)) if "#" not in var]

# Atom registraion
#@register_atoms(pass_metta=True)
def rand_str(run_context):

    mapping = {}

#@register_atoms(pass_metta)
def cnj_exp(metta):

    combineLists = OperationAtom('combine_lists', lambda var1, var2: combine_lists_op(metta, var1, var2),['Atom', 'Atom', Expression], unwrap=False)

    return {
        r"combine_lists": cimbiineLists
    }