// PULLING ZAPS FROM OUTBOX TABLE AND PUSHING THEM TO QUEUE

import { prismaclient } from "prismadb/client";
import { Kafka } from "kafkajs";

const TOPIC_NAME = "zap-events";

const kafka = new Kafka({
  clientId: "outbox-processor",
  brokers: ["localhost:9092"],
});

async function main() {
  const producer = kafka.producer();
  await producer.connect();

  while (1) {
    const pendingRows = await prismaclient.zapRunOutbox.findMany({
      where: {},
      take: 10,
    });
    producer.send({
      topic: TOPIC_NAME,
      messages: pendingRows.map(r => ({
        value: r.zaprunsId,
      })),
    });
  }
}

main();
