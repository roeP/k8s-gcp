provider "docker" {
  host = "tcp://127.0.0.1:2375/"  
}

resource "docker_image" "nginx" {
  name = "nginx"
}

resource "docker_container" "app_nginx" {
  name  = "${var.image_name}"
  image = "${docker_image.nginx.latest}"

  upload {
    content = "${file("${path.module}/nginx.conf")}"
    file =  "/etc/nginx/conf.d/default.conf"
  }

  upload {
    content = "${file("${path.module}/index.html")}"
    file =  "/usr/share/nginx/html/index.html"
  }
}
