import { prismaclient } from "prismadb/client";
import { Kafka } from "kafkajs";

const TOPIC_NAME = "zap-events";

const kafka = new Kafka({
  clientId: "outbox-processor",
  brokers: ["localhost:9092"],
});

async function main() {
  while (1) {
    const consumer = kafka.consumer({ groupId: "main-worker" });
    await consumer.connect();

    await consumer.subscribe({ topic: TOPIC_NAME, fromBeginning: true });

    await consumer.run({
      //main work // Trigger work
    });
  }
}

main();
