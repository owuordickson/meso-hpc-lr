# install.packages("SPOT")
# install.packages("reticulate")
# install.packages("scriptName")

any(grepl("SPOT", installed.packages())) # Returns TRUE
library(reticulate)
library(scriptName)
x <- scriptName::current_filename()
print(dirname(x))
py_run_file("src/main.py")
