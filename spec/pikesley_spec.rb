describe '_site' do
  context 'root' do
    it 'has the correct title' do
      expect('/').to contain """
      <title>
      sam.pikesley.org
      </title>
      """
    end
  end

  context '/cv/' do
    it 'has the correct title' do
      expect('/cv/').to contain """
      <title>
      My CV
      </title>
      """
    end

    context 'jquery' do
      it 'has the right toggle for moo' do
        expect('/cv/').to contain """
        <div class='collapse' id='moo-profile'>
          <p>I joined Moo at the beginning of a massive project to migrate from hosted tin to AWS. This involved jumping in at the deep-end with Terraform and Ansible, and was pretty much all I worked on until July 2017, when we pulled the trigger on a remarkably smooth cut-over.</p>

          <p>The rest of the summer was spent on cleaning-up some things we’d kicked down the road during the migration project, and since September I’ve been on a project to build a Kubernetes-based self-service platform.</p>
        </div>

        <a class='collapsed'
          data-toggle='collapse'
          href='#moo-profile'
          aria-expanded='false'
          aria-controls='moo-profile'>
          <span class='show-ctrl'>
            <i class='fa fa-arrow-circle-down'></i> Read more
          </span>
          <span class='hide-ctrl'>
            <i class='fa fa-arrow-circle-up'></i> Read less
          </span>
        </a>
        """
      end

      it 'has the right toggle for the ODI' do
        expect('/cv/').to contain """
          <p><em>Everything</em> we ever built at the ODI has been built in the open and all of our code is <a href=\"https://github.com/theodi\">up on Github</a>.</p>
        </div>

        <a class='collapsed'
          data-toggle='collapse'
          href='#the-open-data-institute-profile'
          aria-expanded='false'
          aria-controls='the-open-data-institute-profile'>
          <span class='show-ctrl'>
            <i class='fa fa-arrow-circle-down'></i> Read more
          </span>
          <span class='hide-ctrl'>
            <i class='fa fa-arrow-circle-up'></i> Read less
          </span>
          </a>
        """
      end
    end
  end
end
