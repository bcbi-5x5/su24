
function main()
    # greet user
    println("hello, world!")

    # open input file
    input_file_name = "/oscar/data/shared/ursa/synthetic_ri/demo_omop/person.csv"
    input_file = open(input_file_name, "r")

    # create output file
    output_file = open("isarkar_program1_output-jl.txt", "w")


    # dictionary to keep track of gender counts
    pt_gender_count_dict = Dict()

    # read patient line by line to get gender values
    line_count = 0
    for line in eachline(input_file)

        # skip first line
        line_count += 1
        if line_count == 1
            continue
        end

        # split line into array
        line_part_array = split(line, ",")
        gender = line_part_array[2]

        # if the gender has not been encountered, start at 1, otherwise increment by 1
        if !haskey(pt_gender_count_dict, gender)
            pt_gender_count_dict[gender] = 1
        else
            pt_gender_count_dict[gender] += 1
        end
    end

    # report counts to screen
    println("count|gender")
    print(output_file, "count|gender\n")


    # print out unsorted contents of dictionary
    println("unsorted")
    for gender in keys(pt_gender_count_dict)
        println("$(pt_gender_count_dict[gender])|$gender")
        print(output_file, "$(pt_gender_count_dict[gender])|$gender\n")
    end

    # print out sorted contents (by value/count) of dictionary
    println("sorted by values")
    for (count,gender) in sort(collect(zip(values(pt_gender_count_dict),keys(pt_gender_count_dict))), rev=false)
        println("$count|$gender")
        print(output_file, "$count|$gender\n")
    end

end

main()


