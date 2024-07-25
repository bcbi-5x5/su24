 

# python version of program 1

import fileinput

def main():

    # greet user
    print("hello, world!")

    # open input file
    input_file_name = "/oscar/data/shared/ursa/synthetic_ri/demo_omop/person.csv"
    input_file = fileinput.input(input_file_name)

    # create output file
    output_file = open("isarkar_program1_output-py.txt", 'w')

    # dictionary to keep track of gender counts
    pt_gender_dict = {}

    # go through each line of the input file
    line_count = 0
    for line in input_file:

        # increment and skip first line
        line_count += 1
        if line_count == 1:
            continue

        # split on comma and pull out second value to gender
        line_part_array = line.split(",")
        gender = line_part_array[1]

        # if not in gender count dict, start with one, otherwise increment by one
        if not(gender in pt_gender_dict):
            pt_gender_dict[gender] = 1
        else:
            pt_gender_dict[gender] += 1

    # print out headers (for STDOUT and FILE)
    print("count|gender")
    print("count|gender", file = output_file)

    # print non-sorted list by keys of dictionary
    print("unsorted--")
    for gender in pt_gender_dict.keys():
        print(str(pt_gender_dict[gender]) + "|" + gender)
        print(str(pt_gender_dict[gender]) + "|" + gender, file = output_file)

    # print sorted (by value) of dictionary
    print("sorted by values--")
    for gender,count in sorted(pt_gender_dict.items(), key=lambda item:item[1], reverse=True):
        print(str(count) + "|" + gender)
        print(str(count) + "|" + gender, file = output_file)


main()