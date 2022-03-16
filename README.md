# DataPick2D
extract data from a colormap，从云图中提取数据  
本程序采用Wolfram Language语言编写，以.wl程序包的形式发布，运行在Mathematica12上（更低版本的或许也能用）。  
##  使用方法
1. 在Mathematica的笔记本中输入`SystemOpen@$UserBaseDirectory`，运行打开用户目录,把DataPick2D.wl文件放入该目录下的Applications文件，没有的话可以新建一个同名文件；
2. 在笔记本中输入```<< "DataPick2D`"```，载入程序包；
3. 如Figure 1所示，输入```DataPick2D`DataPick2D[picture,data,imagesize]```运行程序包，其中picture是需要提取数据的图片，data是用来存储结果的变量（随便什么名字都行，不一定叫data），imagesize是图片的宽度，该参数可以用来放大或缩小图片；
![Figure 1](https://github.com/Pu240/DataPick2D/blob/main/tutorial_pictures/%E5%BE%AE%E4%BF%A1%E6%88%AA%E5%9B%BE_20220316112929.png)  
                                             <center> Figure 1</center>
4. 运行上述代码出现Figure 1的界面，在Define axes界面可以看到图片上有颜色分别为红、绿、蓝三个点。首先用鼠标拖动绿点到坐标轴原点，把红点拖到x轴上任意刻度清晰位置，同理把蓝点拖动到y轴上任意刻度清晰位置；
5. 在图片下方的x(1)和y(1)旁边的输入框中分别输入绿点的横纵坐标，在x(2)输入红点的横坐标，在y(2)输入蓝点的纵坐标；
6. 在Legend Values输入框中按固定顺序输入图例的刻度值，每输入一个刻度值按一下enter上屏，如果输错就点击back按钮，如果要清除所有已输入刻度就点击reset按钮；
7. 点击Define Legends标题栏，如图Figure 2所示，进入图例定义界面；
![Figure 2](https://github.com/Pu240/DataPick2D/blob/main/tutorial_pictures/%E5%BE%AE%E4%BF%A1%E6%88%AA%E5%9B%BE_20220316115815.png)  
                                              <center>Figure 2</center>  
8. 此时界面上有一个Locator，用鼠标将其移动到第一个已输入的图例刻度值对应的色块上，然后按住alt键+鼠标左键以添加更多Locator，并将新的Locator移动到已输入的各个图例刻度刻度值对应的色块上，注意，生成、放置Locator的数量与顺序要与第6步中输入刻度值的操作严格一致；
9.  点击Edit Markers标题栏，如图Figure 3所示，进入数据提取位置定义界面；  
![Figure 3](https://github.com/Pu240/DataPick2D/blob/main/tutorial_pictures/%E5%BE%AE%E4%BF%A1%E6%88%AA%E5%9B%BE_20220316120847.png)  
                                              <center>Figure 3</center>   
10.  按下alt键+鼠标左键，生成Locator，用鼠标将其拖动到需要提取数据的位置；
11.  点击Results标题栏，如图Figure 4所示，查看结果；
![Figure 4](https://github.com/Pu240/DataPick2D/blob/main/tutorial_pictures/%E5%BE%AE%E4%BF%A1%E6%88%AA%E5%9B%BE_20220316121413.png)  
                                              <center>Figure 4</center>  
12.  Results界面中上部分的点线图是Edit Markers界面中选取数据点的横纵坐标，中间的若干色块表示Define Legends界面中选取的图例色块，此处可以检查色块顺序是否和图例中选取的顺序一致，如果不一致就返回第8步重新选取图例色块，界面的下部分显示的是选取数据点的横纵坐标以及根据当地颜色结合图例数据算出的值。
![Figure 5](https://github.com/Pu240/DataPick2D/blob/main/tutorial_pictures/%E5%BE%AE%E4%BF%A1%E6%88%AA%E5%9B%BE_20220316122736.png)  
                                              <center>Figure 5</center>  
14.  到第12步，计算已经完成，此时数据存储在data变量中.
---
本程序的中间量与结果采用了Dynamic封装，因此对第4-10步进行任意调整都会实时反映到第11步的结果上，同样data也会变化。  
祝开心
