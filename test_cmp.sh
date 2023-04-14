#!/bin/sh

# Usage: 
# test_cmp 'test_name' 'test_command' \
# 'expected_output'
# 
# Steps:
# 1. Create a t/ directory in your hw1/ directory
# 2. Put this test_cmp.sh file in the t/ directory
# 3. Create a test file in the t/ directory (reference the test_example.sh)
# 4. Source the test_cmp.sh file (reference line 3 from test_example.sh)
# 5. Run the test file from your hw1/ directory (by doing ./t/test_example.sh)
test_cmp () {
        failed=0
        echo "Running ${1}" &&
        expect="t/${1}_expect" &&
        actual="t/${1}_actual" &&
        cat >$expect <<-EOF &&
$3
EOF
        eval "${2}" >$actual 2>&1
        cmp "$expect" "$actual" || failed=1
        if [ $failed -eq 0 ]
        then
        rm "$expect" "$actual"
        else
        echo "${1} failed"
        fi
}
