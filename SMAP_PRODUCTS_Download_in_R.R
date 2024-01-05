
#ACTUALIZACIÓN: 05/01/2024
#INFORMACIÓN: 
# COMO DESCARGAR DATOS SMAP DE #https://smap.jpl.nasa.gov/




###### CODIGO DE DESCARGA POR PAQUETE SMAPR #####
#LIBRERIAS----
library(smapr)
library(rhdf5)


#DATOS DE USUARIO DE NASA Earthdata  https://www.earthdata.nasa.gov/
set_smap_credentials("danielnunezibarra","Bkdlg785",overwrite = TRUE)


##### SPL3SMP_E VERSION 5 https://nsidc.org/data/spl3smp_e ####

# ARCHIVOS TEMPORALES QUEDAN guardados EN EL CACHE, HAY QUE ELIMINAR POSTERIORMENTE EN LA CARPETA "C:\Users\USUARIO\AppData\Local\smap\smap\Cache"

#SE PUEDEN ELEGIR DIFERENTES PRODUCTOS DISPONIBLES EN https://nsidc.org/data/smap/data

#ALGUNOS EJEMPLOS
#SPL2SMAP_S ; SPL4SMAU ; SPL3SMP_E

#CICLO DE FECHAS DE DESCARGA
start <- as.Date("2023-06-23")
finish <- as.Date("2023-08-31")
dates <- seq(start, finish, by = "1 day")

#EJEMPLO PARA EL PRUCTO SPL3SMP_E
for (i in 1:length(mes)) {
        fecha<-dates[[i]]
        available_data <- find_smap(id = "SPL3SMP_E", date = fecha, version = 5)
        local_files <- download_smap(available_data, overwrite = TRUE, verbose = FALSE)
        list_smap(local_files[1, ], all = TRUE)
        SPL3SMP_E_AM<- extract_smap(local_files,'/Soil_Moisture_Retrieval_Data_AM/soil_moisture')
        setwd("E:/daniel/tesis/SPL3SMP_E_VERSION_4/AM")
        nombre<-as.character(paste(fecha,".tif",sep="_"))
        writeRaster(SPL3SMP_E_AM, filename=nombre, format="GTiff", overwrite=F)
        
        setwd("E:/daniel/tesis/SPL3SMP_E_VERSION_4/PM")
        nombre2<-as.character(paste(fecha,".tif",sep="_"))
        SPL3SMP_E_PM<- extract_smap(local_files,'/Soil_Moisture_Retrieval_Data_PM/soil_moisture_pm')
        writeRaster(SPL3SMP_E_PM, filename=nombre2, format="GTiff", overwrite=F)
        file.remove(paste0("C:/Users/danie/AppData/Local/smap/smap/Cache/",local_files[1, ]$name,".h5"))
}

