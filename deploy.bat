@echo off
echo ===============================================
echo 🚀 BLOOD BANK FRONTEND DEPLOYMENT STARTED
echo ===============================================

:: Build the project in production mode
call npm run build -- --mode production

:: Define Tomcat webapps path
set TOMCAT_PATH="C:\Program Files\Apache Software Foundation\Tomcat 9.0\webapps"
set PROJECT_NAME=bloodbank
set BUILD_PATH=%cd%\dist

:: Delete old deployment
echo 🧹 Cleaning old deployment...
rmdir /S /Q %TOMCAT_PATH%\%PROJECT_NAME%

:: Create new folder in Tomcat
echo 📁 Creating new folder...
mkdir %TOMCAT_PATH%\%PROJECT_NAME%

:: Copy new build
echo 📦 Copying build files...
xcopy /E /I /Y "%BUILD_PATH%\*" %TOMCAT_PATH%\%PROJECT_NAME%\

:: Restart Tomcat service
echo 🔄 Restarting Tomcat...
net stop Tomcat9
net start Tomcat9

echo ✅ Deployment complete! Open: http://localhost:9090/bloodbank/
pause
