# Ansible Role: PHP7

An Ansible role that installs and configure PHP 7 on Debian/Ubuntu servers.

Current PHP7 version: **7.1**

## Requirements

None.

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

    php_ppa: "ppa:ondrej/php"
    php_packages:
      - php7.1-common
      - php7.1-cli
      - php7.1-intl
      - php7.1-curl
      - php7.1-cgi
      - php7.1-fpm
      - php7.1-mysql
      - php7.1-gd
      - php7.1-mbstring
      - php7.1-mcrypt
    php_timezone: Europe/Warsaw
    php_upload_max_filesize: "20M"
    php_post_max_size: "20M"
    php_memory_limit: "1024M"
    php_max_execution_time: 60

    php_opcache_enable: 1
    php_opcache_revalidate_freq: 2592000
    php_opcache_opcache_validate_timestamps: 1
    php_opcache_max_accelerated_files: 20000
    php_opcache_memory_consumption: 192
    php_opcache_interned_strings_buffer: 16
    php_opcache_fast_shutdown: 1

## Dependencies

None.

## Example Playbook

    - hosts: webservers
      roles:
        - { role: itcraftsmanpl.php7 }

## License

MIT
