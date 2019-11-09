FROM koichiroiijima/hadoop:20191104

ENV SPARK_VERSION=2.4.4
ENV SPARK_HOME=/opt/spark
ENV PATH=${SPARK_HOME}/bin:${PATH}
ENV SPARK_DIST_CLASSPATH="/opt/hadoop//etc/hadoop:/opt/hadoop//share/hadoop/common/lib/*:/opt/hadoop//share/hadoop/common/*:/opt/hadoop//share/hadoop/hdfs:/opt/hadoop//share/hadoop/hdfs/lib/*:/opt/hadoop//share/hadoop/hdfs/*:/opt/hadoop//share/hadoop/mapreduce/lib/*:/opt/hadoop//share/hadoop/mapreduce/*:/opt/hadoop//share/hadoop/yarn:/opt/hadoop//share/hadoop/yarn/lib/*:/opt/hadoop//share/hadoop/yarn/*"

ENV SCALA_VERSION=2.12.9
ENV SCALA_HOME=/usr/share/scala
ENV PATH=${SCALA_HOME}/bin:${PATH}

# Install Scala
RUN set -ex && \
    wget https://downloads.lightbend.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.deb && \
    dpkg -i scala-${SCALA_VERSION}.deb && \
    rm scala-${SCALA_VERSION}.deb && \
    apt-get update && \
    apt-get install --no-install-recommends -y scala \
    && \
# Install Spark
    wget http://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-without-hadoop.tgz && \
    mv spark-${SPARK_VERSION}-bin-without-hadoop.tgz spark.tgz && \
    tar xzvf spark.tgz && \
    rm spark.tgz && \
    mv spark-${SPARK_VERSION}-bin-without-hadoop spark \
    && \
    apt-get clean \
    && \
    rm -rf /var/cache/apk/* \
    && \
    rm -rf /tmp/*

