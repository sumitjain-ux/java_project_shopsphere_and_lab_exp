@echo off
set "JAVA_HOME=C:\Program Files\Microsoft\jdk-17.0.20.8-hotspot"
set "CATALINA_HOME=C:\Users\sumit jain\Downloads\apache-tomcat-11.0.26\apache-tomcat-11.0.26"
if "%SHOPSPHERE_DB_PASSWORD%"=="" (
    for /f "tokens=2*" %%A in ('reg query "HKCU\Environment" /v SHOPSPHERE_DB_PASSWORD 2^>nul') do set "SHOPSPHERE_DB_PASSWORD=%%B"
)
set "SHOPSPHERE_DB_USER=root"
set "SHOPSPHERE_DB_URL=jdbc:mysql://localhost:3306/shopsphere?useSSL=false&serverTimezone=UTC"
set "CATALINA_OPTS=-Dshopsphere.db.password=%SHOPSPHERE_DB_PASSWORD%"
echo Starting Apache Tomcat on port 8080...
call "%CATALINA_HOME%\bin\catalina.bat" run
