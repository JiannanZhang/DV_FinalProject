def convert(r1,r2,w):
    # chekc the precondition: same # of lines
    with open (r1,'r') as in_file1:
        n1 = 0
        while (in_file1.readline() != ""):
            n1 += 1
    with open (r2,'r') as in_file2:
        n2 = 0
        while (in_file2.readline() != ""):
            n2 += 1
    # convert
    if (n1 != n2):
        print ("#s are not match")
    else:
        in_file1 = open(r1,'r')
        in_file2 = open(r2,'r')
        out_file = open(w,'w')
        first_line = True
        for line in in_file1:
            str_list = line.strip().split()
            # write first line title
            if (first_line):
                out_file.write(str_list[0] + ', ' + str_list[1] + ', ' + in_file2.readline().strip().split()[1] + '\n')
                first_line = False
            else:
                date = str_list[0]
                out_file.write(date[4:6] + '/' + date[6:] + '/' + date[:4]  + ', ' + str_list[1] + ', ' + in_file2.readline().strip().split()[1] + '\n')

convert('Townsville_temp_min.txt','Townsville_temp_max.txt','Townsville_temp_1.csv')

# check and delete missing data
with open ('Townsville_temp_1.csv') as fin:
    fout = open('Townsville_temp.csv','w')
    first_line = fin.readline()
    fout.write(first_line)
    for line in fin:
        str_list = line.strip().split()
        if (str_list[1] == '99999.9' or str_list[2] == '99999.9'):
            continue
        fout.write(line)
 












