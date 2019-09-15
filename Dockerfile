FROM redash/redash
USER root
RUN apt-get update --fix-missing && \
    apt-get -y upgrade
RUN apt-get update && apt-get install -y alien unixodbc unixodbc-dev && \
    wget https://download.dremio.com/odbc-driver/1.4.0.1000/dremio-odbc-1.4.0.1000-1.x86_64.rpm && \
    alien -i --scripts dremio-odbc-1.4.0.1000-1.x86_64.rpm && \
    rm -f dremio-odbc-1.4.0.1000-1.x86_64.rpm && \
    pip install pyodbc pandas
ADD dremio_odbc.py /app/redash/query_runner/dremio_odbc.py
ADD dremio_odbc.png /app/client/app/assets/images/db-logos/dremio_odbc.png


