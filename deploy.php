<?php

require_once 'recipe/common.php';

// Symfony shared dirs
set('shared_dirs', ['app/logs', 'src/Frontend/Files']);
// Symfony shared files
set('shared_files', ['app/config/parameters.yml']);

// Environment vars
env('env_vars', 'SYMFONY_ENV=prod');
env('env', 'prod');


// Adding support for the Symfony3 directory structure
//set('bin_dir', 'app');
//set('var_dir', 'app');

/**
 * Create cache dir
 */
task('deploy:create_cache_dir', function () {
    // Set cache dir
    env('cache_dir', '{{release_path}}/' . trim(get('var_dir'), '/') . '/cache');
    // Remove cache dir if it exist
    run('if [ -d "{{cache_dir}}" ]; then rm -rf {{cache_dir}}; fi');
    // Create cache dir
    run('mkdir -p {{cache_dir}}');
    // Set rights
    run("chmod -R g+w {{cache_dir}}");
})->desc('Create cache dir');

/**
 * Dump all assets to the filesystem
 */
task('deploy:assetic:dump', function () {
    run('php {{release_path}}/' . trim(get('bin_dir'), '/') . '/console assetic:dump --env={{env}} --no-debug');
})->desc('Dump assets');

/**
 * Warm up cache
 */
task('deploy:cache:warmup', function () {
    run('php {{release_path}}/' . trim(get('bin_dir'), '/') . '/console cache:warmup  --env={{env}} --no-debug');
})->desc('Warm up cache');


task('deploy', [
    'deploy:prepare',
    'deploy:release',
    'deploy:update_code',
    'deploy:shared',
    'deploy:vendors',
    'deploy:symlink',
    'cleanup',
])->desc('Deploy your project');

/**
 * Main task

task('deploy', [
'deploy:prepare',
'deploy:release',
'deploy:update_code',
'deploy:create_cache_dir',
'deploy:shared',
'deploy:writable',
'deploy:vendors',
'deploy:assetic:dump',
'deploy:cache:warmup',
'deploy:symlink',
'cleanup',
])->desc('Deploy your project');
 */
after('deploy', 'success');


server('prod', '46.101.129.200', 22)
    ->user('andriuss') // pasikeisti username i savo useri
    ->password('6s6AoazCQEPgNu') // pasikeisti pass i savo passworda
    ->stage('production')
    ->env('deploy_path', '/home/andriuss/public'); // pasikeisti username i savo useri

set('repository', 'git@github.com:andsci/hotels.git'); // Pasikeisti i savo git repo url
