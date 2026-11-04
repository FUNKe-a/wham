find_package(BISON REQUIRED)
find_package(FLEX REQUIRED)

bison_target(parser
	grammar/parser.y
	${bin_dir}/parser.cpp
	DEFINES_FILE
		${bin_dir}/parser.tab.hpp
)
flex_target(scanner 
	grammar/scanner.l
	${bin_dir}/scanner.cpp
)
add_flex_bison_dependency(scanner parser)

add_library(grammar)
target_sources(grammar
	PRIVATE
		${FLEX_scanner_OUTPUTS}
		${BISON_parser_OUTPUT_SOURCE}
	PUBLIC
		FILE_SET HEADERS
		BASE_DIRS ${bin_dir}
		FILES
			${BISON_parser_OUTPUT_HEADER}
			${FLEX_parser_OUTPUT_HEADER}
)

add_executable(compiler)
target_sources(compiler
	PRIVATE
		src/main.cpp
)
target_link_libraries(compiler
	PRIVATE
		grammar
)
