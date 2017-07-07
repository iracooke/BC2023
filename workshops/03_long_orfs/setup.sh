NOTEBOOK_HOME="${NOTEBOOK_HOME:-`pwd`}"
export NOTEBOOK_HOME

export PATH=${PATH}:.

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

check_dir(){
    if [[ ${NOTEBOOK_HOME} != $(pwd) ]]; then
        echo "Your working directory seems to have changed. Did you use the cd command?"
        echo "Restart your kernel and then rerun the setup code to fix"
        return 1
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


test_e1(){
    test_answer 1 "$(echo 20455)"
}


test_e2(){
    test_answer 2 "$(head -n 5 genomic_sequence.fasta | translate.py)"
}


test_e3(){
    test_answer 3 "$(translate.py -f 1 genomic_sequence.fasta | tr -cd '*' | wc -m)"
}

test_e4(){
    test_answer 4 "$(translate.py -f 1 genomic_sequence.fasta | tail -n +2 | tr -cd 'C' | wc -m)"
}

test_e5(){
    test_answer 5 "$(translate.py -f 0 --split -F 'tabular' genomic_sequence.fasta | wc -l)"
}

test_e6(){
    test_answer 6 "$(translate.py -f 0 --split -F 'tabular' genomic_sequence.fasta | sort -n -k 6 | tail -n 100 | grep 'M' | wc -l)"
}

echo "Setup Done"