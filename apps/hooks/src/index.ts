import express from "express";
import { prismaclient } from "prismadb/client";
const app = express();
app.use(express.json());

app.post("/hooks/catch/:userId/:zapId", async (req, res) => {
  const userId = req.params.userId;
  const zapId = req.params.zapId;
  const body = req.body;
  // store to db

  await prismaclient.$transaction(async tx => {
    const zaprun = await tx.zapruns.create({
      data: {
        zapId: zapId,
        metadeta: body,
      },
    });

    const zunOutboxRun = await tx.zapRunOutbox.create({
      data: {
        zaprunsId: zaprun.id,
      },
    });
  });

  //push to message queue
  res.json({
    message: "webhooked Recived"
  })
});

app.listen(3000, () => {
  console.log("listening to 3000");
});
