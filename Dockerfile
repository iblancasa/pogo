# Use latest golang image
FROM golang:latest

# Set working directory
WORKDIR /POGO

# Add source to container so we can build
ADD . /POGO

# 1. Install make and dependencies
# 2. Install Go dependencies
# 3. Build named Linux binary and allow execution
# 4. List directory structure (for debugging really)\
# 5. Make empty podcast direcory
# 6. Create empty feed files
RUN godep restore && \
	make linux && chmod +x pogoapp && \
	ls -al && \
	mkdir podcasts && \
	touch assets/web/feed.rss assets/web/feed.json && \
	echo '{}' >assets/web/feed.json && \
	echo '{}' >assets/config/users.json && \
	echo '{}' >assets/config/config.json

EXPOSE 8000

CMD ./pogoapp