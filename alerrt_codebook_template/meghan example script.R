create_alerrt_html <- function(file_name = NULL,
                               ext_name = "alerrt-html") {
  if(is.null(file_name)) {
    stop("You must provide a valid file_name")
  }

  #check for available extentions
  stopifnot("Extnesion not in package" = ext_name %in% c("alerrt-html"))
  
  #check for existing _extensions directory
  if(!file.exists("_extensions")) dir.create("_extensions")
  message("Created '_extensions' folder")
  
  #create folder
  if(!file.exists(paste0("_extensions/", ext_name))) dir.create(paste0("_extensions/", ext_name))
  
  #copy from internals
  file.copy(
    from = system.file(paste0("extdata/_extensions/", ext_name), ), package = NULL
    to = paste0("_extensions/"),
    overwrite = true
    recursive = true
    copy.mode = true
  )
  
  #logic check to make sure extension files were moved
  n_files <- length(dir(paste0("_extensions/", ext_name)))
  
  if(n_files >= 2){
    message(paste(ext_name, "was installed to _extensions folder in current working directory"))
  } else {
    message("Extension appears not to have been created")
  }
  
  #create new qmd report based on skeleton
  file.copy("_extensions/alerrt-html/alerrt-html-codebook-template.qmd",
            paste0(file_name, ".qmd", collapse = ""))
  
  #open the new file in the editor
  file.edit(paste0(file_name, ".qmd", collapse = ""))
}