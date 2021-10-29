package io.mfatih.reservation.client;

import io.mfatih.reservation.channel.ReplyChannelProvider;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.common.header.internals.RecordHeader;
import org.springframework.context.ApplicationContext;
import org.springframework.kafka.requestreply.ReplyingKafkaTemplate;
import org.springframework.kafka.requestreply.RequestReplyFuture;
import org.springframework.kafka.support.KafkaHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;
import org.springframework.util.concurrent.ListenableFuture;
import org.springframework.util.concurrent.SettableListenableFuture;

@Service
public class DemoRPC {

    private final ApplicationContext context;

    private final ReplyChannelProvider provider;

    public DemoRPC(ApplicationContext context, ReplyChannelProvider provider) {
        this.provider = provider;
        this.context = context;
    }

    /**
     * Send request and return a future for result.
     *
     * @param requestTopic topic name
     * @param request      request object
     * @param <V>          Request class type
     * @param <R>          Reply class type
     * @return
     */
    public <V, R> ListenableFuture<R> sendAndReceive(String requestTopic, V request, String key) {
        Assert.isTrue(StringUtils.hasText(requestTopic), "Define request topic.");
        ReplyingKafkaTemplate<String, V, R> kafkaTemplate = context.getBean(ReplyingKafkaTemplate.class);
        // create producer record
        ProducerRecord<String, V> record = new ProducerRecord<>(requestTopic, key, request);
        // set reply topic in header
        record.headers().add(new RecordHeader(KafkaHeaders.REPLY_TOPIC, provider.getChannelName().getBytes()));
        SettableListenableFuture<R> groupFuture = new SettableListenableFuture<>();
        RequestReplyFuture<String, V, R> sendAndReceive = kafkaTemplate.sendAndReceive(record);
        sendAndReceive.addCallback((ConsumerRecord<String, R> result) -> groupFuture.set(result.value()),
            groupFuture::setException);
        return groupFuture;
    }



}
