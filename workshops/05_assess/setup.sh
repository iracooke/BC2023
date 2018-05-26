NOTEBOOK_HOME="${NOTEBOOK_HOME:-`pwd`}"
export NOTEBOOK_HOME

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
    test_answer 1 "Keyboard good, mouse bad"
}


test_e2(){
    test_answer 2 "$(head -n 5 h_pylori.bed)"
}

test_e3(){
    test_answer 3 "$(wc -l h_pylori.bed)"
}

test_e4(){
    test_answer 4 "$(head -n 10 h_pylori.bed | wc -c)"
}

test_e6(){
    test_answer 6 "$(grep '>' h_pylori.faa | wc -l)"
}

test_e8(){
    test_answer 8 "$(cat h_pylori.bed | sort -k 2 -n | head -n 1)"
}

test_e9(){
    test_answer 9 "$(cat h_pylori.bed | sort -k 3 -n -r | head -n 1)"
}

test_e10(){
    test_answer 10 "$(cat h_pylori.bed | cut -f 4 | sort | uniq | wc -l)"
}


echo "Setup Done"