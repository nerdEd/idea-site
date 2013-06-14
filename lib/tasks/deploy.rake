namespace :deploy do

  desc 'deploy to the bohconf talk page'
  task :bohconf do
    `git checkout bohconf`
    `git push bohconf bohconf:master`
  end
end
