find_package(FLEX REQUIRED)

flex_target(lexer grammar/lexer.l ${output_dir}/lexer.cpp)

add_executable(compiler)
target_sources(compiler
	PRIVATE
		${output_dir}/lexer.cpp
)
