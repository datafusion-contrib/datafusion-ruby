install:
	bundle install

test:
	cd ext/datafusion_ruby && rake
	bundle exec rspec

fmt:
	cd ext/datafusion_ruby && cargo fmt
	bundle exec rufo .

fmt-check:
	cd ext/datafusion_ruby && cargo fmt --check
	bundle exec rufo . --check
