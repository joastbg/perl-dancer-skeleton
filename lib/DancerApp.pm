package DancerApp;

use Data::Dumper;
use Dancer::Plugin::Database;
use Dancer::Plugin::DebugDump;
use Dancer::Request::Upload;
use Dancer ':syntax';

our $VERSION = '0.1';

get '/' => sub {
    template 'index' => { name => "Johan" };
};

get '/upload' => sub {
    template 'upload' => { name => "Johan" };
};

post '/upload' => sub {    
    debug params->{filename};
    debug Dumper(request->upload('filename'));
    my $allupload = request->upload('filename');
    $allupload->copy_to('/tmp/' . params->{filename});
    '/tmp/' . params->{filename};

    # save file to hash value

    # add file in cassandra
};

get '/values' => sub {
    #template 'index' => { name => "Johan" };

	template 'index' => {
	 	fruits => [database->quick_select('fruit', {})],
	};

	#debug_dump(database->quick_select('fruit', {}));
};


true;
