package io.mfatih.reservation.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.jsontype.impl.LaissezFaireSubTypeValidator;
import io.mfatih.reservation.channel.ReplyChannelProvider;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.common.serialization.StringDeserializer;
import org.apache.kafka.common.serialization.StringSerializer;
import org.springframework.boot.autoconfigure.kafka.KafkaProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.kafka.config.ConcurrentKafkaListenerContainerFactory;
import org.springframework.kafka.config.KafkaListenerContainerFactory;
import org.springframework.kafka.core.*;
import org.springframework.kafka.listener.ConcurrentMessageListenerContainer;
import org.springframework.kafka.listener.ContainerProperties;
import org.springframework.kafka.listener.KafkaMessageListenerContainer;
import org.springframework.kafka.requestreply.ReplyingKafkaTemplate;
import org.springframework.kafka.support.JacksonUtils;
import org.springframework.kafka.support.serializer.JsonDeserializer;
import org.springframework.kafka.support.serializer.JsonSerializer;

import java.time.Duration;
import java.util.HashMap;
import java.util.Map;

@Configuration
public class RequestReplyConfig<V extends String, R extends Object> {

    private final ReplyChannelProvider replyChannelProvider;

    private final KafkaProperties kafkaProperties;


    public RequestReplyConfig(ReplyChannelProvider replyChannelProvider, KafkaProperties kafkaProperties) {
        this.replyChannelProvider = replyChannelProvider;
        this.kafkaProperties = kafkaProperties;
    }

    @Bean
    public Map<String, Object> producerConfigs() {
        Map<String, Object> props = new HashMap<>();
        // list of host:port pairs used for establishing the initial connections to the Kafka cluster
        props.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, kafkaProperties.getBootstrapServers());
        props.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class);
        props.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, JsonSerializer.class);
        return props;
    }

    @Bean
    public Map<String, Object> consumerConfigs() {
        Map<String, Object> props = new HashMap<>();
        props.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, kafkaProperties.getBootstrapServers());
        props.put(ConsumerConfig.GROUP_ID_CONFIG, "reply-consumer-group");
        return props;
    }

    @Bean
    public ProducerFactory<String, V> producerFactory() {
        ObjectMapper objectMapper = JacksonUtils.enhancedObjectMapper();
        objectMapper.activateDefaultTyping(new LaissezFaireSubTypeValidator(), ObjectMapper.DefaultTyping.NON_CONCRETE_AND_ARRAYS);
        JsonSerializer<V> valueSerializer = new JsonSerializer<>(objectMapper);
        return new DefaultKafkaProducerFactory<>(producerConfigs(), null, valueSerializer);
    }

    @Bean
    public KafkaTemplate<String, V> kafkaTemplate() {
        return new KafkaTemplate<>(producerFactory());
    }

    @Bean
    public ConsumerFactory<String, R> consumerFactory() {
        ObjectMapper objectMapper = JacksonUtils.enhancedObjectMapper();
        objectMapper.activateDefaultTyping(new LaissezFaireSubTypeValidator(), ObjectMapper.DefaultTyping.NON_CONCRETE_AND_ARRAYS);
        JsonDeserializer<R> deserializer = new JsonDeserializer<>(objectMapper);
        deserializer.addTrustedPackages("*");
        return new DefaultKafkaConsumerFactory<>(consumerConfigs(), new StringDeserializer(), deserializer);
    }

    @Bean
    public ReplyingKafkaTemplate<String, V, R> replyKafkaTemplate(
            ProducerFactory<String, V> pf, KafkaMessageListenerContainer<String, R> container) {
        ReplyingKafkaTemplate<String, V, R> replyTemplate = new ReplyingKafkaTemplate<>(pf, container);
        replyTemplate.setDefaultReplyTimeout(Duration.ofMillis(10000L));
        replyTemplate.setSharedReplyTopic(true);
        return replyTemplate;
    }

    @Bean
    public KafkaMessageListenerContainer<String, R> replyContainer(ConsumerFactory<String, R> cf) {
        ContainerProperties containerProperties = new ContainerProperties(replyChannelProvider.getChannelName());
        return new KafkaMessageListenerContainer<>(cf, containerProperties);
    }

    @Bean
    public KafkaListenerContainerFactory<ConcurrentMessageListenerContainer<String, R>> kafkaListenerContainerFactory() {
        ConcurrentKafkaListenerContainerFactory<String, R> factory = new ConcurrentKafkaListenerContainerFactory<>();
        factory.setConsumerFactory(consumerFactory());
        factory.setReplyTemplate(kafkaTemplate());
        return factory;
    }


}

