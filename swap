import os
import hashlib

# Rutas de las carpetas a comparar
carpeta1 = "ruta/de/la/primera/carpeta"
carpeta2 = "ruta/de/la/segunda/carpeta"

# Ruta del archivo de salida para los nombres de los PDFs con diferencias
archivo_diferencias = os.path.join(os.path.dirname(__file__), "diferencias.txt")

# Función para calcular el hash SHA-256 de un archivo
def calcular_hash(ruta_archivo):
    hash_sha256 = hashlib.sha256()
    try:
        with open(ruta_archivo, "rb") as file:
            while chunk := file.read(8192):  # Lee el archivo en bloques de 8192 bytes
                hash_sha256.update(chunk)
        return hash_sha256.hexdigest()
    except Exception as e:
        print(f"Error al calcular hash de {ruta_archivo}: {e}")
        return None

# Función para comparar PDFs de dos carpetas usando hashes
def comparar_pdfs(carpeta1, carpeta2):
    archivos_diferentes = []

    # Listar los archivos PDF en ambas carpetas
    archivos_carpeta1 = {f for f in os.listdir(carpeta1) if f.lower().endswith('.pdf')}
    archivos_carpeta2 = {f for f in os.listdir(carpeta2) if f.lower().endswith('.pdf')}

    # Comparar solo los archivos que estén en ambas carpetas
    archivos_comunes = archivos_carpeta1 & archivos_carpeta2

    for archivo in archivos_comunes:
        ruta_pdf1 = os.path.join(carpeta1, archivo)
        ruta_pdf2 = os.path.join(carpeta2, archivo)

        hash1 = calcular_hash(ruta_pdf1)
        hash2 = calcular_hash(ruta_pdf2)

        # Si los hashes son diferentes, añadir el archivo a la lista de diferencias
        if hash1 != hash2:
            archivos_diferentes.append(archivo)

    return archivos_diferentes

# Ejecutar la comparación y guardar los resultados
diferencias = comparar_pdfs(carpeta1, carpeta2)

if diferencias:
    with open(archivo_diferencias, "w") as file:
        file.write("\n".join(diferencias))
    print(f"Se encontraron diferencias en los siguientes archivos: {archivo_diferencias}")
else:
    print("No hay diferencias en los archivos PDF.")
