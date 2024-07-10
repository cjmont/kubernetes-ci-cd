# Usar una imagen base de Python
FROM python:3.9-slim

# Establecer el directorio de trabajo en el contenedor
WORKDIR /app

# Copiar el contenido del proyecto al directorio de trabajo
COPY . /app

# Copiar el script de entrada
COPY entrypoint.sh /app/entrypoint.sh

# Dar permisos de ejecución al script de entrada
RUN chmod +x /app/entrypoint.sh

# Instalar las dependencias del proyecto
RUN pip install --no-cache-dir -r requirements.txt

# Exponer el puerto 8000 para acceder a la aplicación
EXPOSE 8000

# Configurar el script de entrada
ENTRYPOINT ["/app/entrypoint.sh"]

# Comando por defecto para ejecutar la aplicación
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
