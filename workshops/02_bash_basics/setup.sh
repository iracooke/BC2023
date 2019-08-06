NOTEBOOK_HOME="${NOTEBOOK_HOME:-`pwd`}"
export NOTEBOOK_HOME

export PATH=${PATH}:.

wget -q 'https://www.dropbox.com/s/sf0m60t9tepu0kr/h_pylori.gff?dl=0' -O h_pylori.gff

display_answer(){
    test_answer=$1
    reference_answer=$2
    if [ "${test_answer}" == "${reference_answer}" ]; then
        echo "Your answer is correct"
        return 0
    else
        echo "Answer is incorrect"
        echo "Got     : ${test_answer}" 
        echo "Expected: ${reference_answer}"
        return 1
    fi
}

display_answer_diff(){
    diff_result=$1
    if [ "${diff_result}" == "" ]; then
        echo "Your answer is correct"
        return 0
    else
        echo "Answer is incorrect"
        echo "Differences between your output file and expected output are shown below"
        echo "${diff_result}"
        return 1
    fi
}

check_dir(){
    if [[ ${NOTEBOOK_HOME} != $(pwd) ]]; then
        echo "Your working directory seems to have changed. Did you use the cd command?"
        echo "Restart your kernel and then rerun the setup code to fix"
        return 1
    else
        return 0
    fi
}

check_file(){    
    if [[ ! -f $1 ]];then
        echo "Expected to find a file called $1 but no such file exists"
        return 1
    elif [[ ! -s $1 ]]; then
        echo "Expected the file $1 to contain data but it doesn't. You may have corrupted data. Run setup again"
    else
        return 0
    fi
}


# Defines a helper function for testing answers
test_answer(){
    n=$1
    e="$n"
    test_answer="$(eval e$1_answer)"
    reference_answer=$2
    if [[ check_dir == 1 ]]; then
        check_dir
    else
        display_answer "$test_answer" "$reference_answer"
    fi
}

test_answer_file(){
    n=$1

    if [[ check_dir == 1 ]]; then
        check_dir
    else
        if [[ check_file == 1 ]]; then
            check_file
        else
            display_answer_diff "${2}"
        fi
    fi
}


test_e1(){
    test_answer 1 "$(head -n 5 h_pylori.gff)"
}

test_e2(){
    test_answer 2 "$(wc -l h_pylori.gff)"
}

test_e3(){
    test_answer 3 "$(head -n 5 h_pylori.gff | wc -w)"
}

test_e4(){
    test_answer 4 "$(grep 'pathogenicity' h_pylori.gff | wc -l)"
}

test_e5(){
    e5_answer
    test_answer_file 5 "$(diff h_pylori_path_cds.gff <(grep 'pathogenicity' h_pylori.gff | grep 'CDS') )"
}

test_e6(){
    test_answer 6 "$(grep 'pathogenicity' h_pylori.gff | cut -f 4,5)"
}

test_e7(){
    test_answer 7 "$(cut -f 1 h_pylori.gff | sort -u | grep '#' -v)"
}

echo "Setup Done"