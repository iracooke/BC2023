# This saves the directory where your notebook lives. 
NOTEBOOK_HOME="${NOTEBOOK_HOME:-`pwd`}"
export NOTEBOOK_HOME

#RED=$(tput setaf 1)
#GREEN=$(tput setaf 2)
#NORMAL=$(tput sgr0)

display_answer(){
	test_answer=$1
	reference_answer=$2
    if [ "${test_answer}" == "${reference_answer}" ]; then
        echo "${GREEN}Your answer is correct${NORMAL}"
        return 0
    else
        echo "${RED}Answer is incorrect${NORMAL}"
        echo "Got     : ${test_answer}" 
        echo "Expected: ${reference_answer}"
        return 1
    fi
}

test_e1(){
	display_answer "$(e1_answer)" "$(ls)"
}