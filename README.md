# Amazon Web Services IoT MQTT (TLS Mutual Authentication) Example for Local MQTT Server Usign AWS IoT GreengraasV2

This is an adaptation of the [AWS IoT C SDK](https://github.com/aws/aws-iot-device-sdk-embedded-C) "mqtt_demo_mutual_auth" example for ESP-IDF.

# Provisioning/Configuration

See the README.md in the parent directory for information about configuring the AWS IoT examples.

Few additional steps to be carried out:  

## Find & Set AWS Endpoint Hostname

Your AWS IoT GreengrassV2 has a unique endpoint hostname to connect to (previously configure in AWS IoT GreengrassV2). To find it... [Working progress]

Run `idf.py menuconfig`. Under `Example Configuration`, set the `MQTT Broker Endpoint` to the host name.

## Set Client ID

Run `idf.py menuconfig`. Under `Example Configuration`, set the `MQTT Client ID` to a unique value this id should match the ID under Greengrassv2 Bridge configuration.

The Client ID is used in the MQTT protocol used to send messages to/from AWS IoT. AWS IoT requires that each connected device within a single AWS account uses a unique Client ID. Other than this restriction, the Client ID can be any value that you like. The example default should be fine if you're only connecting one ESP32 at a time.

In a production IoT app this ID would be set dynamically, but for these examples it is compiled in via menuconfig.

## (Optional) Locally Check The Root Certificate

The Root CA certificate provides a root-of-trust when the ESP32 connects to AWS IoT Greengrass. Change the root CA certificate in PEM format in the file `main/certs/root_cert_auth.pem`.

The greengrassV2  certificate is located in the following path `/greengrass/v2/work/aws.greengrass.clientdevices.Auth/ca.pem`


(Replace hostname with your local Greengrass MQTT Broker endpoint host.) The Root CA certificate is the last certificate in the list of certificates printed. You can copy-paste this in place of the existing `root_cert_auth.pem` file.

# Console

After flashing the example to your ESP32 (`idf.py -p [YOURPORT] flash monitor`), it should connect to Amazon IoT GreengrassV2 and start subscriping and publishing to `mytopic`.

In the ESP32's serial output, you should see the logs every couple of seconds.



```

I (8128) coreMQTT: MQTT connection established with the broker.
I (8128) coreMQTT: MQTT connection successfully established with broker.


I (8128) coreMQTT: A clean MQTT connection is established. Cleaning up all the stored outgoing publishes.


I (8138) coreMQTT: Subscribing to the MQTT topic mytopic.
I (8148) coreMQTT: SUBSCRIBE sent for topic mytopic to broker.


I (8168) coreMQTT: Subscribed to the topic mytopic. with maximum QoS 1.


I (8168) coreMQTT: Sending Publish to the MQTT topic mytopic.
I (8168) coreMQTT: PUBLISH sent for topic mytopic to broker with packet ID 2.


I (8258) coreMQTT: De-serialized incoming PUBLISH packet: DeserializerResult=MQTTSuccess.
I (8258) coreMQTT: State record updated. New state=MQTTPubAckSend.
I (8258) coreMQTT: Incoming QOS : 1.
I (8268) coreMQTT: Incoming Publish Topic Name: mytopic matches subscribed topic.
Incoming Publish message Packet Id is 1.
Incoming Publish Message : Hello from ESP32 Local MQTT Broker.


```
# Troubleshooting

If you're having problems with the AWS IoT connection itself, check the Troubleshooting section of the README in the parent directory.
"# aws-freertos-esp32" 
