$pwd = [System.Environment]::GetEnvironmentVariable('SHOPSPHERE_DB_PASSWORD', 'User')
if (-not $pwd) {
    $pwd = $env:SHOPSPHERE_DB_PASSWORD
}
$env:SHOPSPHERE_DB_PASSWORD = $pwd
$env:SHOPSPHERE_DB_USER = "root"
$env:SHOPSPHERE_DB_URL = "jdbc:mysql://localhost:3306/shopsphere?useSSL=false&serverTimezone=UTC"
$env:CATALINA_OPTS = "-Dshopsphere.db.password=$pwd"
$env:JAVA_HOME = "C:\Program Files\Microsoft\jdk-17.0.20.8-hotspot"
$env:CATALINA_HOME = "C:\Users\sumit jain\Downloads\apache-tomcat-11.0.26\apache-tomcat-11.0.26"

Write-Host "Starting Apache Tomcat 11 on http://localhost:8080/shopsphere/ ..." -ForegroundColor Green
& "C:\Users\sumit jain\Downloads\apache-tomcat-11.0.26\apache-tomcat-11.0.26\bin\catalina.bat" start
