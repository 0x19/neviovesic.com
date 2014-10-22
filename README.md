# Nevio Vesic Website

This is my personal website. It's open to public for those who wishes to see the code behind it. There's no greater use of this code except maybe learning something new from me or to point me out into better direction. 

*It's under heavy development. When you see that this line is no longer here, it's out of development.* 

Development version is visible here (if my tunnel is up): http://nevio.ngrok.com

### How to work with CSS


#### Installing Sass and Compass ( Ruby )


#### Running Watcher

```shell
cd neviovesic.com
compass watch
```

### How to compile coffescript

In order to compile coffescript properly you will need to run following command

```shell
cd neviovesic.com
coffee --watch --compile --output public/angular coffee/
```

Command above will watch for any changes within 'coffe/' path and output javascript files into 'public/angular'