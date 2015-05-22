# Gist-LIBLINEAR-CIFAR-10
项目中的训练数据和测试数据是从网络上下载的CIFAR-10，考虑太大，没有传来，运行程序只需要把data_batch1.mat --- data_batch5.mat 和test_batch.mat加入文件中，
就可以在MATLAB中运行.m程序了。

打开MATLAB 运行TrainGist.m  文件 进行训练数据的特征提取，会在E盘下面生成一个Feartures.txt 文件，运行TestGist.m文件，提取测试数据特征，保存在E盘test_data.txt文件当中；然后就得到Train和Predict的输入文件了。

再用Train和Predict进行训练和测试。

打开运行cmd，进入文件目录，
在该目录下输入train -S type Feartures.txt   type可以是从0到7 表示，训练模式。 得到一个Feartures.txt.model 文件 用来做predict的一个输入
 然后predict test_data.txt  Feartures.txt.model  output.txt  就可以得出结果了。

