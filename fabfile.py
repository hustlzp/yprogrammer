from fabric.api import run, env, cd

env.host_string = "root@184.22.89.208"

def start():
    with cd('/var/www/yprogrammer'):
        run('git pull')
        run('gunicorn -c gunicorn.conf yprogrammer.wsgi:application -D')

def restart():
    with cd('/var/www/yprogrammer'):
        run('kill -HUP `cat /tmp/yprogrammer.pid`')

def deploy():
    with cd('/var/www/yprogrammer'):
        run('git pull')
        run('kill -HUP `cat /tmp/yprogrammer.pid`')

def ldeploy():
    with cd('/var/www/yprogrammer'):
        run('git pull')

# back up database files
def backup():
    pass