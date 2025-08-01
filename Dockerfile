# 1. Use an official Node.js runtime as the base image
FROM node:20-alpine

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy package.json and package-lock.json (if present) to the container
COPY package.json package-lock.json* ./

# 4. Install dependencies
RUN npm install

# 5. Copy the rest of your application code to the container
COPY .env.local .env.local

COPY . .

# 6. Build the Next.js app for production
RUN npm run build

# 7. Expose port 3000 (the default port Next.js serves on)
EXPOSE 3000

# 8. Start the Next.js app in production mode
CMD ["npm", "start"]