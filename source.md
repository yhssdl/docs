## 常用 linux 国内源

### Alpine 国内源

1. 清华镜像站

    ``` sh
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories
    sed -i 's/#http/http/g' /etc/apk/repositories
    apk update && apk upgrade
    ```

2. 华为镜像站

    ``` sh
    sed -i 's/dl-cdn.alpinelinux.org/repo.huaweicloud.com/g' /etc/apk/repositories
    sed -i 's/#http/http/g' /etc/apk/repositories
    apk update && apk upgrade
    ```

3. 中科大镜像站

    ``` sh
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
    sed -i 's/#http/http/g' /etc/apk/repositories
    apk update && apk upgrade
    ```

<br>

### Debian 12 国内源

1. 清华镜像站

    ```txt
    cat >/etc/apt/sources.list<<EOF
    deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm main contrib non-free non-free-firmware
    deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm main contrib non-free non-free-firmware
    deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware
    deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware
    deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware
    deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware
    deb https://mirrors.tuna.tsinghua.edu.cn/debian-security bookworm-security main contrib non-free non-free-firmware
    deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security bookworm-security main contrib non-free non-free-firmware
    EOF
    ```

2. 华为镜像站

    ```txt
    cat >/etc/apt/sources.list<<EOF
    deb https://mirrors.huaweicloud.com/debian/ bookworm main non-free non-free-firmware contrib
    deb-src https://mirrors.huaweicloud.com/debian/ bookworm main non-free non-free-firmware contrib
    deb https://mirrors.huaweicloud.com/debian-security/ bookworm-security main
    deb-src https://mirrors.huaweicloud.com/debian-security/ bookworm-security main
    deb https://mirrors.huaweicloud.com/debian/ bookworm-updates main non-free non-free-firmware contrib
    deb-src https://mirrors.huaweicloud.com/debian/ bookworm-updates main non-free non-free-firmware contrib
    deb https://mirrors.huaweicloud.com/debian/ bookworm-backports main non-free non-free-firmware contrib
    deb-src https://mirrors.huaweicloud.com/debian/ bookworm-backports main non-free non-free-firmware contrib
    EOF
    ```

3. 中科大镜像站

    ```txt
    cat >/etc/apt/sources.list<<EOF
    deb https://mirrors.ustc.edu.cn/debian/ bookworm main contrib non-free non-free-firmware
    deb-src https://mirrors.ustc.edu.cn/debian/ bookworm main contrib non-free non-free-firmware
    deb https://mirrors.ustc.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware
    deb-src https://mirrors.ustc.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware
    deb https://mirrors.ustc.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware
    deb-src https://mirrors.ustc.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware
    deb https://mirrors.ustc.edu.cn/debian-security/ bookworm-security main contrib non-free non-free-firmware
    deb-src https://mirrors.ustc.edu.cn/debian-security/ bookworm-security main contrib non-free non-free-firmware
    EOF
    ```

<br>

### Debian 11 国内源

1. 清华镜像站

    ```txt
    cat >/etc/apt/sources.list<<EOF
    deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free
    deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free
    deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free
    deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free
    deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free
    deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free
    deb https://mirrors.tuna.tsinghua.edu.cn/debian-security bullseye-security main contrib non-free
    deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security bullseye-security main contrib non-free
    EOF
    ```

2. 华为镜像站

    ```txt
    cat >/etc/apt/sources.list<<EOF
    deb https://mirrors.huaweicloud.com/debian/ bullseye main non-free contrib
    deb-src https://mirrors.huaweicloud.com/debian/ bullseye main non-free contrib
    deb https://mirrors.huaweicloud.com/debian-security/ bullseye-security main
    deb-src https://mirrors.huaweicloud.com/debian-security/ bullseye-security main
    deb https://mirrors.huaweicloud.com/debian/ bullseye-updates main non-free contrib
    deb-src https://mirrors.huaweicloud.com/debian/ bullseye-updates main non-free contrib
    deb https://mirrors.huaweicloud.com/debian/ bullseye-backports main non-free contrib
    deb-src https://mirrors.huaweicloud.com/debian/ bullseye-backports main non-free contrib
    EOF
    ```

3. 中科大镜像站

    ```txt
    cat >/etc/apt/sources.list<<EOF
    deb https://mirrors.ustc.edu.cn/debian/ bullseye main contrib non-free
    deb-src https://mirrors.ustc.edu.cn/debian/ bullseye main contrib non-free
    deb https://mirrors.ustc.edu.cn/debian/ bullseye-updates main contrib non-free
    deb-src https://mirrors.ustc.edu.cn/debian/ bullseye-updates main contrib non-free
    deb https://mirrors.ustc.edu.cn/debian/ bullseye-backports main contrib non-free
    deb-src https://mirrors.ustc.edu.cn/debian/ bullseye-backports main contrib non-free
    deb https://mirrors.ustc.edu.cn/debian-security/ bullseye-security main contrib non-free
    deb-src https://mirrors.ustc.edu.cn/debian-security/ bullseye-security main contrib non-free
    EOF
    ```

<br>

### Ubunut 23.10 国内源(mantic)

1. 清华镜像站

    ```txt
    cat >/etc/apt/sources.list<<EOF
    deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ mantic main restricted universe multiverse
    deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ mantic main restricted universe multiverse
    deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ mantic-updates main restricted universe multiverse
    deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ mantic-updates main restricted universe multiverse
    deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ mantic-backports main restricted universe multiverse
    deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ mantic-backports main restricted universe multiverse
    deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ mantic-security main restricted universe multiverse
    deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ mantic-security main restricted universe multiverse
    EOF
    ```

<br>

### Ubunut 23.04 国内源(lunar)

1. 清华镜像站

    ```txt
    cat >/etc/apt/sources.list<<EOF
    deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ lunar main restricted universe multiverse
    deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ lunar main restricted universe multiverse
    deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ lunar-updates main restricted universe multiverse
    deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ lunar-updates main restricted universe multiverse
    deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ lunar-backports main restricted universe multiverse
    deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ lunar-backports main restricted universe multiverse
    deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ lunar-security main restricted universe multiverse
    deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ lunar-security main restricted universe multiverse
    EOF
    ```

<br>

### Ubunut 22.04 国内源(jammy)

1. 清华镜像站

    ```txt
    cat >/etc/apt/sources.list<<EOF
    deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse
    deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse
    deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse
    deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse
    deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse
    deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse
    deb http://security.ubuntu.com/ubuntu/ jammy-security main restricted universe multiverse
    deb-src http://security.ubuntu.com/ubuntu/ jammy-security main restricted universe multiverse
    EOF
    ```

2. 阿里镜像站

    ```txt
    cat >/etc/apt/sources.list<<EOF
    deb http://mirrors.aliyun.com/ubuntu/ jammy main restricted universe multiverse
    deb-src http://mirrors.aliyun.com/ubuntu/ jammy main restricted universe multiverse
    deb http://mirrors.aliyun.com/ubuntu/ jammy-security main restricted universe multiverse
    deb-src http://mirrors.aliyun.com/ubuntu/ jammy-security main restricted universe multiverse
    deb http://mirrors.aliyun.com/ubuntu/ jammy-updates main restricted universe multiverse
    deb-src http://mirrors.aliyun.com/ubuntu/ jammy-updates main restricted universe multiverse
    deb http://mirrors.aliyun.com/ubuntu/ jammy-proposed main restricted universe multiverse
    deb-src http://mirrors.aliyun.com/ubuntu/ jammy-proposed main restricted universe multiverse
    deb http://mirrors.aliyun.com/ubuntu/ jammy-backports main restricted universe multiverse
    deb-src http://mirrors.aliyun.com/ubuntu/ jammy-backports main restricted universe multiverse
    EOF
    ```

3. 中科大镜像站

    ```txt
    cat >/etc/apt/sources.list<<EOF
    deb https://mirrors.ustc.edu.cn/ubuntu/ jammy main restricted universe multiverse
    deb-src https://mirrors.ustc.edu.cn/ubuntu/ jammy main restricted universe multiverse
    deb https://mirrors.ustc.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse
    deb-src https://mirrors.ustc.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse
    deb https://mirrors.ustc.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse
    deb-src https://mirrors.ustc.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse
    deb https://mirrors.ustc.edu.cn/ubuntu/ jammy-security main restricted universe multiverse
    deb-src https://mirrors.ustc.edu.cn/ubuntu/ jammy-security main restricted universe multiverse
    EOF
    ```

<br>

### Ubunut 20.04 国内源(focal)

1. 清华镜像站

    ```txt
    cat >/etc/apt/sources.list<<EOF
    deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse
    deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse
    deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
    deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
    deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
    deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
    deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse
    deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse
    EOF
    ```

2. 阿里镜像站

    ```txt
    cat >/etc/apt/sources.list<<EOF
    deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
    deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
    deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
    deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
    deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
    deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
    deb http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
    deb-src http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
    deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
    deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
    EOF
    ```

3. 中科大镜像站

    ```txt
    cat >/etc/apt/sources.list<<EOF
    deb https://mirrors.ustc.edu.cn/ubuntu/ focal main restricted universe multiverse
    deb-src https://mirrors.ustc.edu.cn/ubuntu/ focal main restricted universe multiverse
    deb https://mirrors.ustc.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
    deb-src https://mirrors.ustc.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
    deb https://mirrors.ustc.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
    deb-src https://mirrors.ustc.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
    deb https://mirrors.ustc.edu.cn/ubuntu/ focal-security main restricted universe multiverse
    deb-src https://mirrors.ustc.edu.cn/ubuntu/ focal-security main restricted universe multiverse
    deb https://mirrors.ustc.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse
    deb-src https://mirrors.ustc.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse
    EOF
    ```

### PVE 国内源

1. 删除默认企业源

    ```sh
    rm -rf /etc/apt/sources.list.d/pve-enterprise.list
    ```

2. 软件源 `/etc/apt/sources.list.d/pve-no-subscription.list`

- 清华源

    ```sh
    cat >/etc/apt/sources.list.d/pve-no-subscription.list<<EOF
    deb https://mirrors.tuna.tsinghua.edu.cn/proxmox/debian/pve bookworm pve-no-subscription
    EOF
    ```

- 中科大源

    ```sh
    cat >/etc/apt/sources.list.d/pve-no-subscription.list<<EOF
    deb https://mirrors.ustc.edu.cn/proxmox/debian/pve bookworm pve-no-subscription
    EOF
    ```

1. CT 模板

- 清华源

    ```sh
    cp /usr/share/perl5/PVE/APLInfo.pm /usr/share/perl5/PVE/APLInfo.pm_back
    sed -i 's|http://download.proxmox.com|https://mirrors.tuna.tsinghua.edu.cn/proxmox|g' /usr/share/perl5/PVE/APLInfo.pm
    EOF
    systemctl restart pvedaemon  # 稍等下手动刷新webui 页面
    ```

- 中科大源

    ```sh
    cp /usr/share/perl5/PVE/APLInfo.pm /usr/share/perl5/PVE/APLInfo.pm_back
    sed -i.bak "s#http://download.proxmox.com/images#https://mirrors.ustc.edu.cn/proxmox/images#g" /usr/share/perl5/PVE/APLInfo.pm  
    EOF
    systemctl restart pvedaemon  # 稍等下手动刷新webui 页面
    ```