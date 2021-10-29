package io.mfatih.reservation.channel;

import org.apache.kafka.clients.admin.NewTopic;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.GenericApplicationContext;
import org.springframework.kafka.config.TopicBuilder;
import org.springframework.stereotype.Component;

import java.util.UUID;

/**
 * application wide reply channel provider
 */
@Component
public class ReplyChannelProvider {

    private static final Logger LOGGER = LoggerFactory.getLogger(ReplyChannelProvider.class);

    /**
     * instance specific reply channel
     */
    private String channelName;


    public ReplyChannelProvider(GenericApplicationContext context){
        channelName = "reply-channel-" + UUID.randomUUID().toString();
        //replication count might be set later on
        context.registerBean(channelName, NewTopic.class, ()-> TopicBuilder.name(channelName)
                .partitions(1)
                .replicas(1)
                .build() );
        LOGGER.info("Reply channel initiated");
    }


    /**
     * get reply channel name
     * @return
     */
    public String getChannelName() {
        return channelName;
    }

}
