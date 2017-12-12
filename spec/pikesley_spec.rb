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
    end
  end
end
