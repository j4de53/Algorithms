execute_process(
    COMMAND "${VM}" "${INPUT}"
    RESULT_VARIABLE code
    OUTPUT_VARIABLE output
    ERROR_VARIABLE error_output
)

if(EXPECTED MATCHES "error\\.out$")
    if(code EQUAL 0 OR NOT error_output MATCHES "Error:")
        message(FATAL_ERROR "Expected an error.\nExit: ${code}\nOutput: ${output}\nError: ${error_output}")
    endif()
else()
    if(NOT code EQUAL 0)
        message(FATAL_ERROR "VM failed: ${error_output}")
    endif()
    file(READ "${EXPECTED}" expected)
    if(NOT output STREQUAL expected)
        message(FATAL_ERROR "Output mismatch.\nExpected:\n${expected}\nActual:\n${output}")
    endif()
endif()
