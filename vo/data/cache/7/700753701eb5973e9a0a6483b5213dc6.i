a:103:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1;}i:3;a:3:{i:0;s:12:"section_edit";i:1;a:4:{i:0;i:-1;i:1;i:0;i:2;i:1;i:3;s:0:"";}i:2;i:1;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:47:"Running CherryPy behind Apache2 with mod_python";i:1;i:2;i:2;i:1;}i:2;i:1;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:60;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:329:"
Here are some brief notes on how I got CherryPy working nicely with Apache, instead of the default built-in webserver. Remember to check the CherryPy and Apache log files for error tracebacks! mod_python has the annoying habit of reporting `unrecoverable' server errors, but the tracebacks should still be available in the logs.";}i:2;i:61;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:390;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:390;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"Version information:";}i:2;i:392;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:412;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:412;}i:13;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:47:"CherryPy 3.1.2, Apache 2.2.13, mod_python 3.3.1";}i:2;i:414;}i:14;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:461;}i:15;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:461;}i:16;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:91:"http://www.electricmonk.nl/Writings/HomePage?action=download&upname=cherrypy_modpython.html";i:1;s:20:"Some excellent notes";}i:2;i:463;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:32:" (which I found after the fact).";}i:2;i:579;}i:18;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:611;}i:19;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:613;}i:20;a:3:{i:0;s:12:"section_edit";i:1;a:4:{i:0;i:1;i:1;i:612;i:2;i:2;i:3;s:47:"Running CherryPy behind Apache2 with mod_python";}i:2;i:613;}i:21;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"Configuring Apache";i:1;i:3;i:2;i:613;}i:2;i:613;}i:22;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:613;}i:23;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:639;}i:24;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:189:"
I chose to host CherryPy from port 8080, to keep the default ports free. Once mod_python is compiled and placed in the appropriate directory, put the code below in a separate conf file in ";}i:2;i:640;}i:25;a:3:{i:0;s:14:"monospace_open";i:1;a:0:{}i:2;i:829;}i:26;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"/etc/apache2/other/";}i:2;i:831;}i:27;a:3:{i:0;s:15:"monospace_close";i:1;a:0:{}i:2;i:850;}i:28;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:":";}i:2;i:852;}i:29;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:853;}i:30;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:494:"Listen 8080
LoadModule python_module libexec/apache2/mod_python.so

<VirtualHost *:8080>
        DocumentRoot "/Users/Azrael/VO/conesearch"
        <Location />
                Allow From All
                PythonPath "sys.path+['/Users/Azrael/VO/conesearch']"
                SetHandler python-program
                PythonHandler cherrypy._cpmodpy::handler
                PythonOption cherrypy.setup initialise::serverless
                PythonDebug On
        </Location>
</VirtualHost>
";i:1;s:6:"apache";i:2;s:13:"cherrypy.conf";}i:2;i:860;}i:31;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1383;}i:32;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:23:"Things to be aware of: ";}i:2;i:1385;}i:33;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1408;}i:34;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1408;}i:35;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:217:"The application's working directory is '/'! This means that any referencing to files such as configurations or databases need to be absolute instead of relative. You always need to specify the entire path to the file.";}i:2;i:1410;}i:36;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1627;}i:37;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1627;}i:38;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:123:"Because Apache and CherryPy cache various bits and pieces, you must restart Apache to see any changes in your python code: ";}i:2;i:1629;}i:39;a:3:{i:0;s:14:"monospace_open";i:1;a:0:{}i:2;i:1752;}i:40;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"apachectl -k graceful";}i:2;i:1754;}i:41;a:3:{i:0;s:15:"monospace_close";i:1;a:0:{}i:2;i:1775;}i:42;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:".";}i:2;i:1777;}i:43;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1778;}i:44;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1778;}i:45;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:"The 'launcher' python script is in ";}i:2;i:1780;}i:46;a:3:{i:0;s:14:"monospace_open";i:1;a:0:{}i:2;i:1815;}i:47;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:40:"/Users/Azrael/VO/consearch/initialise.py";}i:2;i:1817;}i:48;a:3:{i:0;s:15:"monospace_close";i:1;a:0:{}i:2;i:1857;}i:49;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:". The ";}i:2;i:1859;}i:50;a:3:{i:0;s:14:"monospace_open";i:1;a:0:{}i:2;i:1865;}i:51;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"serverless()";}i:2;i:1867;}i:52;a:3:{i:0;s:15:"monospace_close";i:1;a:0:{}i:2;i:1879;}i:53;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:28:" method starts the CherryPy ";}i:2;i:1881;}i:54;a:3:{i:0;s:13:"emphasis_open";i:1;a:0:{}i:2;i:1909;}i:55;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"without";}i:2;i:1911;}i:56;a:3:{i:0;s:14:"emphasis_close";i:1;a:0:{}i:2;i:1918;}i:57;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:" the built-in webserver.";}i:2;i:1920;}i:58;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1944;}i:59;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1944;}i:60;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:173:"Take care with the architecture of compiled python modules. For example, the default Apache server on OSX 10.5 is compiled as 64-bit. This means all extension modules (like ";}i:2;i:1946;}i:61;a:3:{i:0;s:14:"monospace_open";i:1;a:0:{}i:2;i:2119;}i:62;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:8:"psycopg2";}i:2;i:2121;}i:63;a:3:{i:0;s:15:"monospace_close";i:1;a:0:{}i:2;i:2129;}i:64;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:42:", as I found out) need to be compiled for ";}i:2;i:2131;}i:65;a:3:{i:0;s:14:"monospace_open";i:1;a:0:{}i:2;i:2173;}i:66;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:"x86_64";}i:2;i:2175;}i:67;a:3:{i:0;s:15:"monospace_close";i:1;a:0:{}i:2;i:2181;}i:68;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:". The default for Python's ";}i:2;i:2183;}i:69;a:3:{i:0;s:14:"monospace_open";i:1;a:0:{}i:2;i:2210;}i:70;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:"distutils";}i:2;i:2212;}i:71;a:3:{i:0;s:15:"monospace_close";i:1;a:0:{}i:2;i:2221;}i:72;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:" is for 32-bit, i.e. ";}i:2;i:2223;}i:73;a:3:{i:0;s:14:"monospace_open";i:1;a:0:{}i:2;i:2244;}i:74;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:"i386";}i:2;i:2246;}i:75;a:3:{i:0;s:15:"monospace_close";i:1;a:0:{}i:2;i:2250;}i:76;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:2:".
";}i:2;i:2252;}i:77;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2254;}i:78;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2254;}i:79;a:3:{i:0;s:12:"section_edit";i:1;a:4:{i:0;i:613;i:1;i:2253;i:2;i:3;i:3;s:18:"Configuring Apache";}i:2;i:2254;}i:80;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:36:"Configuring CherryPy - initialise.py";i:1;i:3;i:2;i:2254;}i:2;i:2254;}i:81;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:2254;}i:82;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1169:"
import cherrypy
import conesearch

__doc__ = """
Master configuration file for setting up one or more CherryPy
Cone Search services (apps). Each app must be mounted at a 
separate location.
"""

def start():
    # Site-wide config
    cherrypy.config.update(conesearch.current_dir+'/site.config')
    # Mount the static files so they are accessible by all
    config = {'/static':{'tools.staticdir.on': True,'tools.staticdir.dir': cones
earch.current_dir+'/static',}}
    cherrypy.tree.mount(conesearch.Common(), '/common', config)
    # Mount each app and load its own config
    cherrypy.tree.mount(conesearch.ConeSearch(), "/ucac3", conesearch.current_di
r+'/ucac3.config')
    cherrypy.engine.start()

def serverless():
    # USE APACHE WITH MOD_PYTHON ON mothra.anu.edu.au:8088
    cherrypy.server.unsubscribe()
    cherrypy.engine.timeout_monitor.unsubscribe() 
    cherrypy.engine.autoreload.unsubscribe() 
    start()

def serve():
    # USE CHERRYPY BUILT-IN SERVER ON PORT 8088
    cherrypy.engine.autoreload.subscribe()
    cherrypy.config.update({'server.socket_port':8088})
    start()
    cherrypy.engine.block()

if __name__ == "__main__":
    serve()

";i:1;s:6:"python";i:2;s:13:"initialise.py";}i:2;i:2305;}i:83;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3505;}i:84;a:3:{i:0;s:12:"section_edit";i:1;a:4:{i:0;i:2254;i:1;i:3504;i:2;i:3;i:3;s:36:"Configuring CherryPy - initialise.py";}i:2;i:3505;}i:85;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:36:"Testing using the built-in webserver";i:1;i:3;i:2;i:3505;}i:2;i:3505;}i:86;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:3505;}i:87;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3549;}i:88;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:36:"
To run using CherryPy's webserver: ";}i:2;i:3550;}i:89;a:3:{i:0;s:14:"monospace_open";i:1;a:0:{}i:2;i:3586;}i:90;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"python initialise.py";}i:2;i:3588;}i:91;a:3:{i:0;s:15:"monospace_close";i:1;a:0:{}i:2;i:3608;}i:92;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3610;}i:93;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3610;}i:94;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:55:"To avoid conflicts with the Apache-hosted version, the ";}i:2;i:3612;}i:95;a:3:{i:0;s:14:"monospace_open";i:1;a:0:{}i:2;i:3667;}i:96;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"serve()";}i:2;i:3669;}i:97;a:3:{i:0;s:15:"monospace_close";i:1;a:0:{}i:2;i:3676;}i:98;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:157:" method mounts the CherryPy webserver at port 8088. Turning on auto-reload will restart the CherryPy webserver automatically after each source code change. 
";}i:2;i:3678;}i:99;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3834;}i:100;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3834;}i:101;a:3:{i:0;s:12:"section_edit";i:1;a:4:{i:0;i:3505;i:1;i:0;i:2;i:3;i:3;s:36:"Testing using the built-in webserver";}i:2;i:3834;}i:102;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:3834;}}