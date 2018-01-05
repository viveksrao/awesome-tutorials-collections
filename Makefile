build:
	rm -rf public
	hugo
deploy: build
	aws s3 sync public/ s3://awesome-tutorials.club --acl public-read --delete
	aws configure set preview.cloudfront true
	aws cloudfront create-invalidation --distribution-id E36UCEZ5JOWS4W --path '/*'
