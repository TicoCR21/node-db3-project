const db = require( "../data/db-config" );

const find = () => db( "schemes" );

const findById = id => db( "schemes" ).where( "id", id ).first();

const findSteps = id => db( "schemes as a" )
                          .join( "steps as b", "a.id", "b.scheme_id" )
                          .where( "b.scheme_id", id )
                          .select( "b.id", "a.scheme_name", "b.step_number", "b.instructions" );

const add = scheme => db( "schemes" ).insert( scheme, "id" ).then( response => findById( response[ 0 ] ) )

const update = ( changes, id ) => db( "schemes" )
                                    .where( { id } )
                                    .update( changes )
                                    .then( () => findById( id ) );

const remove = id => findById( id )
                      .then( response => db( "schemes" )
                        .where( { id } )
                        .del()
                        .then( value => new Promise( ( resolve, reject ) => { value ? resolve( response ) : reject( "failed" ) } ) ) );                                    

const addStep = ( step, scheme_id ) =>  db( "steps" )
                                          .insert( { scheme_id, ...step  } )
                                          .then( ( [ id ] ) => db( "steps" ).where( { id } ).first() );

module.exports = { find, findById, findSteps, add, update, remove, addStep };