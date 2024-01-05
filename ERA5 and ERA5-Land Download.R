#ACTUALIZACIÓN: 05/01/2024

#INFORMACIÓN:
#DESCARGA A TRAVES DE https://cds.climate.copernicus.eu/
#PARA REVISAR LAS SOLICITUDES (REQUEST) REVISAR https://cds.climate.copernicus.eu/cdsapp#!/yourrequests

### SCRIPT PARA DESCARGAR EN ERA5 Y ERA5-LAND----


#LIBRERIAS-----
library(ecmwfr)
library(lubridate)

#DATOS DE USUARIO DE CDS. SE PUEDEN VER EN https://cds.climate.copernicus.eu/user/TU_NUMERO_DE_USUARIO
cds.key <- "Inserta_tu_API_KEY" 
wf_set_key(user = "Inserta_tu_UID", key = cds.key, service = "cds")


# EN area SE PUEDE ELEGIR LA ZONA DE DESCARGA:
# ES TOMADA DE NORTE (N), OESTE (W), SUR (S), ESTE (E)
# UN EJEMPLO
ae<-c(-35.5, -73, -38, -71.5) #CAUQUENES, CHILE

# EN dataset_short_name SE PUEDE ELEGIR ENTRE:
# ERA5 "reanalysis-era5-single-levels",
# ERA5LAND "reanalysis-era5-land"

# EN variable SE PUEDE ELEGIR ENTRE:
#"Volumetric soil water layer 1"
#"Volumetric soil water layer 2"
#"Volumetric soil water layer 3"
#"Volumetric soil water layer 4" (ENTRE OTRAS VARIABLES DISPONIBLES)


# EN date SE PUEDE ELEGIR LA FECHA:
date <- as.Date("2015-01-01") 

# EN time LAS HORAS QUE SE QUIEREN:
# EN target SE SELECCIONA EL NOMBRE DEL ARCHIVO

#LA SOLICITUD (REQUEST) SE ENVIA FINALMENTE ASI:
request <- list(
        dataset_short_name = "reanalysis-era5-land",
        product_type   = "reanalysis",
        format = "netcdf",
        variable = "Volumetric soil water layer 1",
        date= date,
        time = c("00:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00"),
        # area is specified as N, W, S, E
        area = ae,
        target = "ELIGE_ELNOMBRE_DEL_ARCHIVO_AQUI.nc")

#EN ESTE APARTADO HAY QUE ELEGIR EL DIRECTORIO Y AGREGAR NUEVAMENTE EL UID
file <- wf_request(user = "Inserta_tu_UID",
                   request = request,
                   transfer = TRUE,
                   path = "C:/USUARIO/ELIGE_TU_DIRECTORIO_AQUI",
                   time_out = 1,
                   verbose = TRUE)

