# wang
for test jenkins

项目名称:wang
项目简介：
测试jenkins流水线，实现自动生成镜像，在k8s中启动
项目文件介绍：
index.html为项目文件
Dockerfile 拉取基础镜像centos7，在此基础上安装nginx，并将项目文件拷贝到镜像中，生成项目镜像
wang-k8s.yaml 为k8s文件，用项目文件建立站点
