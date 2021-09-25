# Manage your DB with PGAdmin Web UI
&nbsp;

Execute this command to start OmniDB in docker

    ./runPGAdmin.sh

Then open this address in your browser:

    http://YOUR_SERVER_IP:34343/

Default credentials will be:

    login: root@pg.local
    password: 6a350b22-95dd-4a7a-9f00-52157103594f


## Once connected 

1) please change the credentials to something secure :)
To do that click on the user icon in the top right corner, then  click on the change password link and set a new strong password like a GUID then click on "Change Password".

2) add a DB Connection
Click on "Add New Server" under the Dashboard tab then fill the line with:

    Name: openvm_monitoring

    Hostname / address: 172.17.0.1

    Maintainance Database: postgresql

    Port: 5432
    
    User: postgres

    Password: postgres

    Save Password?: Checked

Then save and test the connection by selecting the connection

You should now be able to browser your database :)
