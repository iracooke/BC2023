NOTEBOOK_HOME="${NOTEBOOK_HOME:-`pwd`}"
export NOTEBOOK_HOME

rm -rf ${NOTEBOOK_HOME}/E2
mkdir E2
echo "1" > E2/5_H.txt
echo "11" > E2/2_E.txt
echo "111" > E2/3_L.txt
echo "1111" > E2/4_L.txt
echo "11111" > E2/1_O.txt
echo "1111" > E2/1_O.csv

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

test_e1(){
    if [[ check_dir == 1 ]]; then
        check_dir
    else
        display_answer "$(e1_answer)" "$(ls)"
    fi
}


test_e2(){
    if [[ check_dir == 1 ]]; then
        check_dir
    else
        display_answer "$(e2_answer)" "$(ls -r )"
    fi
}

test_e3(){
    if [[ check_dir == 1 ]]; then
        check_dir
    else
        display_answer "$(e3_answer)" "$(ls E2)"
    fi
}

test_e4(){
    if [[ check_dir == 1 ]]; then
        check_dir
    else
        display_answer "$(e4_answer)" "$(ls -1 -Sr E2)"
    fi
}

test_e5(){
    if [[ check_dir == 1 ]]; then
        check_dir
    else
        display_answer "$(e5_answer)" "$(ls -1 -Sr E2/*.txt)"
    fi
}

echo "Setup Done"