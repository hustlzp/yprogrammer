from fabric.api import run, env, cd

host_string = "root@192.241.159.34"


def first():
    env.host_string = host_string
    with cd('/var/www/lishengchun'):
        # nginx
        run('cp nginx.conf /etc/nginx/sites-available/yp')
        run('ln -sf /etc/nginx/sites-available/yp /etc/nginx/sites-enabled/')
        run('nginx -s reload')

        # supervisor
        run('cp supervisor.conf /etc/supervisor/conf.d/yp.conf')
        run('supervisorctl reread')
        run('supervisorctl update')


def restart():
    env.host_string = host_string
    run('supervisorctl restart yp')


def deploy():
    env.host_string = host_string
    with cd('/var/www/yprogrammer'):
        run('git pull')
        run('supervisorctl restart yp')