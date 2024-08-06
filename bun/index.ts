import { PrismaClient } from "@prisma/client";

const main = async () => {
  // Create a new Prisma Client
  const prisma = new PrismaClient();

  // Create a new application
  const application = await prisma.application.create({
    data: {
      first: {
        create: {
          name: "Alice",
        },
      },
      second: {
        create: {
          name: "Bob",
        },
      },
    },
  });

  // Get all applications
  const applications = await prisma.application.findMany();

  // Print the results
  console.log("Created application:", application);
  console.log("All applications:", applications);
};

main();
