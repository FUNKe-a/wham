find_package(BISON REQUIRED)
find_package(FLEX REQUIRED)

bison_target(parser
	grammar/wham_parse.y
	${bin_dir}/wham_parse.cpp
	DEFINES_FILE
		${bin_dir}/wham_parse.tab.hpp
)
flex_target(scanner 
	grammar/wham_scan.l
	${bin_dir}/wham_scan.cpp
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
